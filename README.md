# Sql_Study

> sql 접속방법

conn `sys(유저)`혹은 `system(관리자)`/비번

> 사용자 생성

create user `설정한 아이디` identified by `설정할비번`

> 만든 계정에 권한 부여

grant connt, resource, dba to `설정한 아이디`

> hr계정 잠금해제(커밋)

alter user hr account unlock;
alter user hr identified by 비번;

> 잠금한 hr계정 권한 부여

grant connect, resource to hr;

> 저장

`commit;`

> 원격 접속을 해제하는법

exec dbms_xdb.setlistenerlocalaccess(false);
