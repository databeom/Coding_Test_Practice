def solution(record):
    userdict = {} 
    answer = []

    for line in record:
        line = line.split(" ")

        if line[0] == "Enter":
            userdict[line[1]] = line[2]
        elif line[0] == "Change":
            userdict[line[1]] = line[2]

    for line in record:
        line = line.split(" ")
        targetString = userdict[line[1]]
        if line[0] == "Enter":
            targetString += "님이 들어왔습니다."
        elif line[0] == "Leave":
            targetString += "님이 나갔습니다."
        else:
            continue
        answer.append(targetString)

    return answer
