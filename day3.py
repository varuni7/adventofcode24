import re

def process_file():
    
    with open("input3.txt", "r") as f:
        return f.read()

def handle_instructions(s):
    
    mul_enabled = True   
    total_ans = 0
    p = r"(do\(\))|(don't\(\))|mul\((\d{1,3}),(\d{1,3})\)"
    matches = re.findall(p, s)
    
    for match in matches:
        if match[0] == "do()": 
            mul_enabled = True
        elif match[1] == "don't()": 
            mul_enabled = False
        elif match[2] and match[3]: 
                num1 = int(match[2])
                num2 = int(match[3])
                total_ans += num1 * num2 * mul_enabled
                

    return total_ans
 
s = process_file()
 
total_sum = handle_instructions(s)
print(f"Total Sum of Enabled Multiplications: {total_sum}")
