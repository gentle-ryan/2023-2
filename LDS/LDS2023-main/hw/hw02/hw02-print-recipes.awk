# Linguistics and Data Science [hw02]
# Release date: 2023-10-08
# Due date: 2023-10-13 1:00 PM

BEGIN {
    RS="\r?\n\r?\n(\r?\n)+" # 줄바꿈 문자 세 개 이상의 연쇄
    FS="\r?\n(\r?\n)+" # 줄바꿈 문자 두 개 이상의 연쇄
    ORS="\n\n"
    OFS="\n"
}
/^\[[0-9]+\]/ {
    gsub("[ \n]\\[[0-9]+\\]", "", $0) # 각주 번호 제거
    gsub("_\\[[0-9]+\\]_", "", $0) # 라틴어 원문의 각주 번호 제거
    gsub("\r?\n", " ", $2)
    gsub("_", "", $1) 
    gsub("  +", "", $1)

    print $1, $2 > "data/apicius/recipes.txt"
}