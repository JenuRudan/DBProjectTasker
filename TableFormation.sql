CREATE TABLE `projecttaskerdb`.`users` (
  `ID` INT NOT NULL,
  `Username` VARCHAR(10) NOT NULL,
  `Password` VARCHAR(10) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC));

  
  CREATE TABLE `projecttaskerdb`.`projects` (
  `ID` INT NOT NULL,
  `Admin_ID` INT NULL,
  `Project_Name` VARCHAR(45) NOT NULL,
  `Project_Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Admin_ID_idx` (`Admin_ID` ASC),
  CONSTRAINT `Admin_ID`
    FOREIGN KEY (`Admin_ID`)
    REFERENCES `projecttaskerdb`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	CREATE TABLE `projecttaskerdb`.`tasks` (
  `Task_ID` INT NOT NULL,
  `Project_ID` INT NOT NULL,
  `Handler_ID` INT NOT NULL,
  `Task_Name` VARCHAR(45) NOT NULL,
  `Deadline` DATE NULL,
  PRIMARY KEY (`Task_ID`),
  INDEX `Taske_Handler_idx` (`Handler_ID` ASC),
  INDEX `Project_ID_idx` (`Project_ID` ASC),
  CONSTRAINT `Taske_Handler`
    FOREIGN KEY (`Handler_ID`)
    REFERENCES `projecttaskerdb`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Project_ID`
    FOREIGN KEY (`Project_ID`)
    REFERENCES `projecttaskerdb`.`projects` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	
	ALTER TABLE `projecttaskerdb`.`tasks` 
ADD COLUMN `IsFinished` BINARY NULL DEFAULT 0 AFTER `Deadline`,
ADD COLUMN `FinishedDate` DATE NULL DEFAULT NULL AFTER `IsFinished`;


CREATE TABLE `projecttaskerdb`.`friends` (
  `Friendship ID` INT NOT NULL,
  `Friend_ID` INT NOT NULL,
  `User_ID` INT NOT NULL,
  PRIMARY KEY (`Friendship ID`),
  INDEX `Friendship_idx` (`Friend_ID` ASC),
  INDEX `Friendship_USER_idx` (`User_ID` ASC),
  CONSTRAINT `Friendship`
    FOREIGN KEY (`Friend_ID`)
    REFERENCES `projecttaskerdb`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Friendship_USER`
    FOREIGN KEY (`User_ID`)
    REFERENCES `projecttaskerdb`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
