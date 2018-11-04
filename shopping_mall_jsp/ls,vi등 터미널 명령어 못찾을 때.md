Mac terminal command not found



터미널창에 다음과같이 써줌

export PATH=%PATH:/bin:/usr/local/bin:/usr/bin



이때부터 vi, ls등의 명령어 사용가능

유저 디렉토리에서 .bash_profile 수정

vi .bash_profile

export PATH=%PATH:/bin:/usr/local/bin:/usr/bin



저장 후 적용

source .bash_profile



출처: http://arcanelux.tistory.com/entry/vi-ls-ssh등-터미널에서-명령어를-찾을-수-없을-때 [DevArcanelux]
