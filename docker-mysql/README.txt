
Connect from command line with:

    docker exec -it mysql mysql -uroot -p


If you wanna connect via MySQL Workbench or cline mysql Run this within MySQL:

    CREATE USER 'patrick'@'%' IDENTIFIED BY 'P@ssw0rd123';
    GRANT ALL PRIVILEGES ON *.* TO 'patrick'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;


