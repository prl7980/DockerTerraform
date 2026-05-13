# DockerTerraform


SQL Restore
docker cp /Users/Patricklynch/Datasets/Movies/SQL/Backup/Movies.bak sqlserver:/
docker cp /Users/Patricklynch/Datasets/Adventureworks/AdventureWorks2022.bak sqlserver:/
sqlcmd -S 127.0.0.1 -U sa -P"$TF_VAR_db_password" -Q "RESTORE DATABASE [Movies] FROM DISK = N'/Movies.bak'"
sqlcmd -S 127.0.0.1 -U sa -P"$TF_VAR_db_password" -Q "RESTORE DATABASE [AdventureWorks] FROM DISK = N'/AdventureWorks2022.bak'"
