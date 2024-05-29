import sqlite3
import json


conn = sqlite3.connect('cricket_odi_db.db')
cursor = conn.cursor()


with open('Ind_NZ_5.json') as f:
    data = json.load(f)


match_type = data['info']['match_type']
season = data['info']['season']
event = data['info']['event']['name']
team_type = data['info']['team_type']
match_number = data['info']['event']['match_number']

############### match table insert ###############


cursor.execute('''
                   INSERT INTO match(match_type,event,season,teams_involve,match_no)
                   VALUES (?,?,?,?,?)  
                   ''',(match_type,event,season,team_type,match_number,))

cursor.execute('''
        SELECT match_id
        FROM match
        WHERE match_type = ? AND event = ? AND season = ? AND teams_involve = ? AND match_no = ?
        ''', (match_type, event, season, team_type, match_number))

result = cursor.fetchone()
match_id = result[0]


# ############### team table insert ###############

teams = data['info']['teams']

for team in teams:
    cursor.execute('''
                INSERT OR IGNORE INTO team(team_name)
                VALUES (?)  
''',(team,))


############### venue table insert ###############


stadium_name = data['info']['venue']
city = data['info']['city']

cursor.execute('''
                 INSERT OR IGNORE INTO venue(stadium_name,city)
                VALUES (?,?)  
 ''',(stadium_name,city))




officials = data['info']['officials']

ofc_types = ['match_referees', 'tv_umpires', 'umpires']


for ofc_type in ofc_types:
      for name in officials[ofc_type]:
        cursor.execute('''
        SELECT 1 FROM official WHERE ofc_type = ? AND ofc_name = ?
        ''', (ofc_type, name))
        if cursor.fetchone() is None:
            cursor.execute('''
            INSERT INTO official (ofc_type, ofc_name)
            VALUES (?, ?)
            ''', (ofc_type, name))
     
for ofc_type in ofc_types:
      for name in officials[ofc_type]:
        cursor.execute('''
        SELECT ofc_id FROM official WHERE ofc_type = ? AND ofc_name = ?
        ''', (ofc_type, name))
        ofc_result = cursor.fetchone()
        ofc_id=ofc_result[0]
        cursor.execute('''
            INSERT INTO official_match (match_id, ofc_id)
            VALUES (?, ?)
            ''', (match_id, ofc_id))
     


team_player = data['info']['players']

for team in team_player:
    cursor.execute('''
       SELECT team_id FROM team WHERE team_name = ? 
        ''', (team,))
    team_result = cursor.fetchone()
    team_id = team_result[0]
    
    players = team_player[team]
    for player_id in players:
        cursor.execute('''
            INSERT INTO player(match_id,team_id,player_name) VALUES (?,?,?)            
    ''',(match_id,team_id,player_id,))
        

team_a = data['info']['teams'][0]
team_b = data['info']['teams'][1]
winner = data['info']['outcome']['winner']
target = data['innings'][1]['target']['runs']
toss_win = data['info']['toss']['winner']
decision = data['info']['toss']['decision']
player_of_match = data['info']['player_of_match'][0]
venue = data['info']['venue']
date = data['info']['dates'][0]


cursor.execute('''
        SELECT team_id
        FROM team
        WHERE team_name = ?
        ''', (team_a,))

result = cursor.fetchone()
team_a = result[0]


cursor.execute('''
        SELECT team_id
        FROM team
        WHERE team_name = ?
        ''', (team_b,))

result = cursor.fetchone()
team_b = result[0]

cursor.execute('''
        SELECT team_id
        FROM team
        WHERE team_name = ?
        ''', (winner,))

result = cursor.fetchone()
winner = result[0]

cursor.execute('''
        SELECT team_id
        FROM team
        WHERE team_name = ?
        ''', (toss_win,))

result = cursor.fetchone()
toss_win = result[0]


cursor.execute('''
        SELECT player_id
        FROM player
        WHERE player_name = ?
        ''', (player_of_match,))

result = cursor.fetchone()
player_of_match = result[0]


cursor.execute('''
        SELECT venue_id
        FROM venue
        WHERE stadium_name = ? AND city = ?
        ''', (venue,city,))

result = cursor.fetchone()
venue_id = result[0]



cursor.execute('''
            INSERT INTO match_details VALUES (?,?,?,?,?,?,?,?,?,?)            
     ''',(match_id,team_a,team_b,target,winner,toss_win,decision,player_of_match,venue_id,date,))
        

winner_by = data['info']['outcome']['by']

if 'runs' in winner_by:
   by_runs = winner_by['runs']

   cursor.execute('''
            INSERT INTO winner_by_runs (match_id, by_runs)
            VALUES (?, ?)
            ''', (match_id, by_runs))
elif 'wickets' in winner_by:
   by_wickets = winner_by['wickets']

   cursor.execute('''
            INSERT INTO winner_by_wickets (match_id, by_wickets)
            VALUES (?, ?)
            ''', (match_id, by_wickets))
   
     


bat_team_id_1 = data['innings'][0]['team']
ball_team_id_1 = data['innings'][1]['team']


cursor.execute('''
        SELECT team_id
        FROM team
        WHERE team_name = ?
        ''', (bat_team_id_1,))
      
result = cursor.fetchone()
bat_team_id_1 = result[0]


cursor.execute('''
            SELECT team_id
            FROM team
            WHERE team_name = ?
            ''', (ball_team_id_1,))
      
result = cursor.fetchone()
ball_team_id_1 = result[0]




inning_1 = data['innings'][0]['overs']

for index,inning in enumerate(inning_1):
    over_no = inning_1[index]['over']
    ball_no = 1

    deliveries = inning_1[index]['deliveries']
    
    for i,deliver in enumerate(deliveries):
      flg = 0

      batter = deliveries[i]['batter']
      bowler = deliveries[i]['bowler']
      non_striker = deliveries[i]['non_striker']
      extras = deliveries[i].get('extras',{})
      batter_runs = deliveries[i]['runs']['batter']
      extra_runs = deliveries[i]['runs']['extras']
      total_runs = deliveries[i]['runs']['total']
      wickets = deliveries[i].get('wickets',{})
      #print(batter)

    #   print(over_no)
    #   print(ball_no)
    #   ball_no = ball_no + 1

      cursor.execute('''
          SELECT player_id
          FROM player
          WHERE player_name = ? AND team_id = ?
          ''',(batter,bat_team_id_1,))
      
      result = cursor.fetchone()
      batter = result[0]
      #print(batter)



      cursor.execute('''
          SELECT player_id
          FROM player
          WHERE player_name = ? AND team_id = ?
          ''', (bowler,ball_team_id_1))
      
      result = cursor.fetchone()
      bowler = result[0]
      #print(bowler)

      cursor.execute('''
          SELECT player_id
          FROM player
          WHERE player_name = ? AND team_id = ?
          ''', (non_striker,bat_team_id_1,))
      result = cursor.fetchone()
      non_striker = result[0]
      #print(non_striker)

      for key in extras.keys():
        cursor.execute('''
             INSERT INTO extras VALUES (?,?,?,?,?,?)            
     ''',(match_id,ball_team_id_1,over_no+1,ball_no,key,extra_runs,))
        

        if key == 'wides' or key == 'noballs':
           ball_no = ball_no - 1
           flg=1
        # print(key)
 
      ball_no = ball_no + 1   

      if flg == 0:
        # print(over_no+1)
        # print(ball_no-1)

        cursor.execute('''
             INSERT INTO innings VALUES (?,?,?,?,?,?,?,?,?,?)            
      ''',(match_id,bat_team_id_1,ball_team_id_1,over_no+1,ball_no-1,batter,non_striker,bowler,batter_runs,total_runs,))
         
      if len(wickets) > 0 :
        #   print(over_no+1)
        #   print(ball_no-1)
          kind = wickets[0]['kind']
          batsman_out = wickets[0]['player_out']
          
          cursor.execute('''
          SELECT player_id
          FROM player
          WHERE player_name = ? AND team_id = ?
          ''',(batsman_out,bat_team_id_1,))
      
          result = cursor.fetchone()
          batsman_out = result[0]

          cursor.execute('''
             INSERT INTO wickets VALUES (?,?,?,?,?,?,?,?)            
          ''',(match_id,ball_team_id_1,bat_team_id_1,over_no+1,ball_no-1,kind,batsman_out,bowler))
        
       



inning_2 = data['innings'][1]['overs']



for index,inning in enumerate(inning_2):
    over_no = inning_2[index]['over']
    ball_no = 1

    deliveries = inning_2[index]['deliveries']
    
    for i,deliver in enumerate(deliveries):
      flg = 0

      batter = deliveries[i]['batter']
      bowler = deliveries[i]['bowler']
      non_striker = deliveries[i]['non_striker']
      extras = deliveries[i].get('extras',{})
      batter_runs = deliveries[i]['runs']['batter']
      extra_runs = deliveries[i]['runs']['extras']
      total_runs = deliveries[i]['runs']['total']
      wickets = deliveries[i].get('wickets',{})
      

      cursor.execute('''
          SELECT player_id
          FROM player
          WHERE player_name = ? AND team_id = ?
          ''',(batter,ball_team_id_1,))
      
      result = cursor.fetchone()
      batter = result[0]
      #print(batter)



      cursor.execute('''
          SELECT player_id
          FROM player
          WHERE player_name = ? AND team_id = ?
          ''', (bowler,bat_team_id_1))
      
      result = cursor.fetchone()
      bowler = result[0]
      #print(bowler)

      cursor.execute('''
          SELECT player_id
          FROM player
          WHERE player_name = ? AND team_id = ?
          ''', (non_striker,ball_team_id_1,))
      result = cursor.fetchone()
      non_striker = result[0]
      #print(non_striker)

      for key in extras.keys():
        cursor.execute('''
             INSERT INTO extras VALUES (?,?,?,?,?,?)            
     ''',(match_id,bat_team_id_1,over_no+1,ball_no,key,extra_runs,))
        

        if key == 'wides' or key == 'noballs':
           ball_no = ball_no - 1
           flg=1
        # print(key)
 
      ball_no = ball_no + 1   

      if flg == 0:
        # print(over_no+1)
        # print(ball_no-1)

        cursor.execute('''
             INSERT INTO innings VALUES (?,?,?,?,?,?,?,?,?,?)            
      ''',(match_id,ball_team_id_1,bat_team_id_1,over_no+1,ball_no-1,batter,non_striker,bowler,batter_runs,total_runs,))
         
      if len(wickets) > 0 :
        #   print(over_no+1)
        #   print(ball_no-1)
          kind = wickets[0]['kind']
          batsman_out = wickets[0]['player_out']
          
          cursor.execute('''
          SELECT player_id
          FROM player
          WHERE player_name = ? AND team_id = ?
          ''',(batsman_out,ball_team_id_1,))
      
          result = cursor.fetchone()
          batsman_out = result[0]

          cursor.execute('''
             INSERT INTO wickets VALUES (?,?,?,?,?,?,?,?)            
          ''',(match_id,bat_team_id_1,ball_team_id_1,over_no+1,ball_no-1,kind,batsman_out,bowler))
        
       






















    # print(over_no)
    # print(bowler)
    # print(non_striker)
    # print(batter_runs)
    # print(extra_runs)
    # print(total_runs)
    # print(ball_no)
    #ball_no = ball_no + 1










# print(data['innings'][0]['overs'][0]['deliveries'][0]['batter'])







# for inning in enumerate(inning_1):
#     over_no = inning_1[0]['over']

#     deliveries = inning_1[0]['deliveries']
    
#     for deliver in deliveries:
#         batter = deliver['batter']
#         print(batter)



conn.commit()
conn.close()
