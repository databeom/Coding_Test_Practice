def solution(k, m, score):
    score.sort(reverse=True)
    revenue=0
    for i in range(m-1,len(score),m):
        revenue += score[i]*m
    return revenue



print(solution(	4, 3, [4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))