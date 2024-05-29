import sqlite3
import json


conn = sqlite3.connect('cricket_odi_db.db')
cursor = conn.cursor()


with open('Ind_NZ_4.json') as f:
    data = json.load(f)





inning_1 = data['innings'][0]['overs']

for index,inning in enumerate(inning_1):
    over_no = inning_1[index]['over']
    ball_no = 1

    deliveries = inning_1[index]['deliveries']
    
    for i,deliver in enumerate(deliveries):
      flg = 0
      extras = deliveries[i].get('extras',{})
      wickets = deliveries[i].get('wickets',{})
      #print(batter)

    #   print(over_no)
    #   print(ball_no)
    #   ball_no = ball_no + 1

      
      

      for key in extras.keys():
        
        if key == 'wides' or key == 'noballs':
           ball_no = ball_no - 1
           flg=1
        print(key)
 
      ball_no = ball_no + 1   

      if flg == 0:
        # print(over_no+1)
        # print(ball_no-1)

        
       if len(wickets) > 0 :
        #   print(over_no+1)
        #   print(ball_no-1)
        print(wickets)
          
          
       






inning_2 = data['innings'][1]['overs']



for index,inning in enumerate(inning_2):
    over_no = inning_2[index]['over']
    ball_no = 1

    deliveries = inning_2[index]['deliveries']
    
    for i,deliver in enumerate(deliveries):
      flg = 0

      
      extras = deliveries[i].get('extras',{})
      wickets = deliveries[i].get('wickets',{})
      

      
      

      for key in extras.keys():
        
        if key == 'wides' or key == 'noballs':
           ball_no = ball_no - 1
           flg=1
        # print(key)
 
      ball_no = ball_no + 1   

      if flg == 0:
        # print(over_no+1)
        # print(ball_no-1)

       if len(wickets) > 0 :
        #   print(over_no+1)
        #   print(ball_no-1)
          print(wickets)
         





















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
