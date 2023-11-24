record = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]

# def solution(record):
#     answer = []
#     return answer

# V1
def solution(record):
    result = []
    user_name = {}
    for i in record:
        if i.split(' ')[0] == 'Enter':    # in
            result.append(f"{i.split(' ')[1]}님이 들어왔습니다.")
            user_name[i.split(' ')[1]] = i.split(' ')[2]
        elif i.split(' ')[0] == 'Leave':  # out
            result.append(f"{i.split(' ')[1]}님이 나갔습니다.")
        elif i.split(' ')[0] == 'Change': # Cange
            user_name[i.split(' ')[1]] = i.split(' ')[2]

    answer = []
    for j in result:
        answer.append(user_name[j.split('님')[0]] + '님' + j.split('님')[1])
    return answer

# V2 Enter, Leave → Dic
print(solution(record))