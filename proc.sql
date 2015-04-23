DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Member`(IN ID int, IN user_name varchar(45), IN User_Password varchar(45), IN Email varchar(45))
BEGIN
insert into members (ID,UserName,Password,Email) values (ID,user_name,User_Password,Email);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Project`(IN ID int, IN Admin_ID int, IN Project_Name varchar(45), IN Description varchar(45))
BEGIN
insert into projects (ID,AdminID,ProjectName,Description) values (ID,Admin_ID,Project_Name,Description);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Task`(IN TaskID int, IN ProjectID int, IN TaskName varchar(45), IN DeadLine DATE,IsFinished Binary,FinishedDate Date)
BEGIN
insert into tasks (TaskID,ProjectID,TaskName,DeadLine,IsFinished,FinishedDate) values (TaskID,ProjectID,TaskName,DeadLine,IsFinished,FinishedDate);
END$$
DELIMITER ;

USE `projecttasker`;
DROP procedure IF EXISTS `Remove_Task`;

DELIMITER $$
USE `projecttasker`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Task`(IN TaskID int)
BEGIN
delete from tasks where TaskID = TaskID;
END$$

DELIMITER ;

USE `projecttasker`;
DROP procedure IF EXISTS `Remove_Project`;

DELIMITER $$
USE `projecttasker`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Project`(IN ProjectID int)
BEGIN
delete from Projects where ID = ProjectID;
END$$

DELIMITER ;

DELIMITER $$
USE `projecttasker`$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Member_Task`(IN MemberID int, IN TaskID int)
BEGIN
delete from memberstasks where MemberID = MemberID and TaskID = TaskID;
END$$

DELIMITER ;

DELIMITER $$
USE `projecttasker`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Member_Project`(IN MemberID int, IN ProjectID int)
BEGIN
delete from projectsmembers where MemberID = MemberID and ProjectID = ProjectID;
END$$

DELIMITER ;

DELIMITER $$
USE `projecttasker`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Project_Task`(IN TaslID int, IN ProjectID int)
BEGIN
delete from Projectstasks where TaskID = TaskID and ProjectID = ProjectID;
END$$

DELIMITER ;




DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Member_Project`(IN ProjectID int, IN MemberID int)
BEGIN
insert into projectsmembers (ProjectID,MemberID) values (ProjectID,MemberID);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Member_Task`(IN MemberID int, IN TaskID int)
BEGIN
insert into memberstasks (MemberID,TaskID) values (MemberID,TaskID);
END$$
DELIMITER ;