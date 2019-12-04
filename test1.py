#! /Users/lreznak-/.brew/bin/python3

import json
import pandas as pd 

# за массив был признан стандартный питоновский список, поэтому
# сформируем его.
answer_array = [] 

with open('task_2.json') as f:
    raw_data = json.load(f)
    df = pd.DataFrame(raw_data)
    for shop in set(df.shop):
        tmp = list(df[df.shop == shop]["product"])
        tmp.append(shop)
        answer_array.append(tmp) 
    print(answer_array)
