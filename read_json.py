import json

src = "/home/mylee/llemma/llemma_formal2formal/their_output/llemma7b_minif2f_test/results__llemma7b__3.json"
tar = "/home/mylee/llemma/llemma_formal2formal/their_output/llemma7b_minif2f_test/results__llemma7b__3__comp.json"
with open(src, 'r') as s, open(tar, 'w') as t:
    data = json.load(s)
    short_results = []
    
    for result in data['results']:
        
        theorem = result['attempt_results'][0]['theorem']
        success = result['attempt_results'][0]['success']
        if success == True:
            proof = str(result['attempt_results'][0]['proof'])
        else :
            proof = None        

        short_result = {'theorem': theorem, 'proof': proof, 'success': success}
        short_results.append(short_result)
    json.dump(short_results, t)

