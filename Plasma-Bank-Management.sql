-- -----------------------------------------------------
-- Schema plasma_bank_management_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `plasma_bank_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `plasma_bank_management_system` ;

-- -----------------------------------------------------
-- Table `plasma_bank_management_system`.`donor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plasma_bank_management_system`.`donor` (
  `Donor_Name` VARCHAR(25) NOT NULL,
  `Address` VARCHAR(25) NOT NULL,
  `Contact_No` VARCHAR(15) NOT NULL,
  `Date_of_Birth` DATE NULL,
  `Blood_Group` VARCHAR(5) NOT NULL,
  `Donor_Id` INT NOT NULL,
  PRIMARY KEY (`Donor_Id`));

INSERT INTO DONOR VALUES("Hafsa Tajrin", "Dhaka", "01841188024", STR_TO_DATE('1984-03-12','%Y-%m-%d'), "B+", 001);
INSERT INTO DONOR VALUES("Abdur Rahim", "Dhaka", "01617775300", STR_TO_DATE('1987-04-28','%Y-%m-%d'), "A+", 002);
INSERT INTO DONOR VALUES("Maruf Billah", "Khulna", "01993287224", STR_TO_DATE('1989-08-07','%Y-%m-%d'), "O+", 003);
INSERT INTO DONOR VALUES("AKM Niloy", "Mymensingh", "01721084016", STR_TO_DATE('1975-05-30','%Y-%m-%d'), "B+", 004);
INSERT INTO DONOR VALUES("Muminul Fahim", "Sylhet", "01733700709", STR_TO_DATE('1996-01-22','%Y-%m-%d'), "O+", 005);
INSERT INTO DONOR VALUES("Rony Islam", "Rajshahi", "01749964017", STR_TO_DATE('1979-06-29','%Y-%m-%d'), "B+", 006);
INSERT INTO DONOR VALUES("Junayed Asif", "Rangpur", "01774343394", STR_TO_DATE('1988-10-06','%Y-%m-%d'), "AB+", 007);
INSERT INTO DONOR VALUES("Badshah Miah", "Sylhet", "01791805513", STR_TO_DATE('1986-09-21','%Y-%m-%d'), "AB+", 008);
INSERT INTO DONOR VALUES("Joy Saha", "Mymensingh", "01812744330", STR_TO_DATE('1995-11-27','%Y-%m-%d'), "B+", 009);
INSERT INTO DONOR VALUES("Tasnuva Tabassum", "Dhaka", "01743039013", STR_TO_DATE('1992-02-11','%Y-%m-%d'), "B+", 010);
INSERT INTO DONOR VALUES("Maruf Hasan", "Sylhet", "01893918383", STR_TO_DATE('1988-08-09','%Y-%m-%d'), "AB+", 011);
INSERT INTO DONOR VALUES("Piyal Hasan", "Chittagong", "01812376168", STR_TO_DATE('1990-02-26','%Y-%m-%d'), "A+", 012);

-- -----------------------------------------------------
-- Table `plasma_bank_management_system`.`plasma_receiver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plasma_bank_management_system`.`plasma_receiver` (
  `Patient_Name` VARCHAR(25) NOT NULL,
  `Patient_Id` INT NOT NULL,
  `Phone_Number` VARCHAR(15) NOT NULL,
  `Address` VARCHAR(25) NOT NULL,
  `Blood_Group` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`));

INSERT INTO PLASMA_RECEIVER VALUES("Nurul Hasan", "001", "01718345131", "Chittagong", "A+");
INSERT INTO PLASMA_RECEIVER VALUES("Sifat Islam", "002", "01771080595", "Dhaka", "B+");
INSERT INTO PLASMA_RECEIVER VALUES("Farhin Alam", "003", "01799970987", "Mymensingh", "B+");
INSERT INTO PLASMA_RECEIVER VALUES("Forhad Alam", "004", "01730191834", "Mymensingh", "B+");
INSERT INTO PLASMA_RECEIVER VALUES("Mominul Haque", "005", "01749341075", "Sylhet", "O+");
INSERT INTO PLASMA_RECEIVER VALUES("Nasima Akter", "006", "01783434345", "Dhaka", "A+");
INSERT INTO PLASMA_RECEIVER VALUES("Feroj Ahmed", "007", "01759210080", "Sylhet", "AB+");
INSERT INTO PLASMA_RECEIVER VALUES("Rakibul Islam", "008", "01622011981", "Sylhet", "AB+");
INSERT INTO PLASMA_RECEIVER VALUES("Manik Hasan", "009", "01964395761", "Dhaka", "B+");
INSERT INTO PLASMA_RECEIVER VALUES("Saiful Islam", "010", "01521249751", "Rangpur", "AB+");
INSERT INTO PLASMA_RECEIVER VALUES("Anirban Sarker", "011", "01990272384", "Khulna", "O+");
INSERT INTO PLASMA_RECEIVER VALUES("Nur Alam", "012", "01927932117", "Rajshahi", "B+");

-- -----------------------------------------------------
-- Table `plasma_bank_management_system`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plasma_bank_management_system`.`hospital` (
  `Hospital_Name` VARCHAR(35) NOT NULL,
  `Address` VARCHAR(35) NOT NULL,
  `Contact_No` VARCHAR(15) NOT NULL,
  `Plasma_Id` VARCHAR(10) NOT NULL,
  `Patient_Id` INT NOT NULL,
  PRIMARY KEY (`Plasma_Id`),
  INDEX `Patient_Id_idx` (`Patient_Id` ASC) VISIBLE,
  CONSTRAINT `Patient_Id`
    FOREIGN KEY (`Patient_Id`)
    REFERENCES `plasma_bank_management_system`.`plasma_receiver` (`Patient_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO HOSPITAL VALUES("DMCH", "Dhaka", "01983121331", "B+_01", 002);
INSERT INTO HOSPITAL VALUES("DMCH", "Dhaka", "01983121331", "A+_02", 006);
INSERT INTO HOSPITAL VALUES("KMCH", "Khulna", "041-760350", "O+_01", 011);
INSERT INTO HOSPITAL VALUES("MMCH", "Mymensingh", "091-66063", "B+_01M", 003);
INSERT INTO HOSPITAL VALUES("SMCH", "Sylhet", "0821-713667", "O+_01S", 005);
INSERT INTO HOSPITAL VALUES("RMCH", "Rajshahi", "0721-772150", "B+_01R", 012);
INSERT INTO HOSPITAL VALUES("RNMCH", "Rangpur", "0521-53881", "AB+_01RN", 010);
INSERT INTO HOSPITAL VALUES("SMCH", "Sylhet", "0821-713667", "AB+_01S", 007);
INSERT INTO HOSPITAL VALUES("MMCH", "Mymensingh", "091-66063", "B+_02M", 004);
INSERT INTO HOSPITAL VALUES("DMCH", "Dhaka", "01983121331", "B+_02", 009);
INSERT INTO HOSPITAL VALUES("SMCH", "Sylhet", "0821-713667", "AB+_02S", 008);
INSERT INTO HOSPITAL VALUES("CMCH", "Chittagong", "031-630335", "A+_01C", 001);

-- -----------------------------------------------------
-- Table `plasma_bank_management_system`.`plasmapheresis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plasma_bank_management_system`.`plasmapheresis` (
  `Plasmapheresis_Id` INT(10) NOT NULL,
  `Separated_Units` INT NOT NULL,
  `Blood_Group` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Plasmapheresis_Id`));

INSERT INTO PLASMAPHERESIS VALUES(001, 2, "B+");
INSERT INTO PLASMAPHERESIS VALUES(002, 1, "A+");
INSERT INTO PLASMAPHERESIS VALUES(003, 1, "O+");
INSERT INTO PLASMAPHERESIS VALUES(004, 2, "B+");
INSERT INTO PLASMAPHERESIS VALUES(005, 2, "O+");
INSERT INTO PLASMAPHERESIS VALUES(006, 1, "B+");
INSERT INTO PLASMAPHERESIS VALUES(007, 2, "AB+");
INSERT INTO PLASMAPHERESIS VALUES(008, 1, "AB+");
INSERT INTO PLASMAPHERESIS VALUES(009, 1, "B+");
INSERT INTO PLASMAPHERESIS VALUES(010, 2, "B+");
INSERT INTO PLASMAPHERESIS VALUES(011, 2, "AB+");
INSERT INTO PLASMAPHERESIS VALUES(012, 1, "A+");

-- -----------------------------------------------------
-- Table `plasma_bank_management_system`.`blood_bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plasma_bank_management_system`.`blood_bank` (
  `Bank_Name` VARCHAR(25) NOT NULL,
  `Location` VARCHAR(25) NOT NULL,
  `Blood_Number_Units` INT NOT NULL,
  `Contact_No` VARCHAR(15) NOT NULL,
  `Donor_Id` INT NOT NULL,
  `Bank_Id` VARCHAR(10) NOT NULL,
  `Plasmapheresis_Id` INT NOT NULL,
  `Dnum_In_BB` VARCHAR(10) NOT NULL,
  INDEX `Donor_Id_idx` (`Donor_Id` ASC) VISIBLE,
  INDEX `Bank_Id_idx` (`Bank_Id` ASC) VISIBLE,
  INDEX `Plasmapheresis_Id_idx` (`Plasmapheresis_Id` ASC) VISIBLE,
  PRIMARY KEY (`Dnum_In_BB`),
  CONSTRAINT `Donor_Id`
    FOREIGN KEY (`Donor_Id`)
    REFERENCES `plasma_bank_management_system`.`donor` (`Donor_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bank_Id`
    FOREIGN KEY (`Bank_Id`)
    REFERENCES `plasma_bank_management_system`.`hospital` (`Plasma_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Plasmapheresis_Id`
    FOREIGN KEY (`Plasmapheresis_Id`)
    REFERENCES `plasma_bank_management_system`.`plasmapheresis` (`Plasmapheresis_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO BLOOD_BANK VALUES("Dhaka Blood Bank", "Dhaka", 2, "01714010869", 001, "B+_01", 001, "DBB-01");
INSERT INTO BLOOD_BANK VALUES("Dhaka Blood Bank", "Dhaka", 1, "01714010869", 002, "A+_02", 002, "DBB-02");
INSERT INTO BLOOD_BANK VALUES("Khulna Blood Bank", "Khulna", 1, "01885455592", 003, "O+_01", 003, "KBB-01");
INSERT INTO BLOOD_BANK VALUES("Mymensingh Blood Bank", "Mymensingh", 2, "01521443904", 004, "B+_01M", 004, "MBB-01");
INSERT INTO BLOOD_BANK VALUES("Sylhet Blood Bank", "Sylhet", 2, "01937591604", 005, "O+_01S", 005, "SBB-01");
INSERT INTO BLOOD_BANK VALUES("Rajshahi Blood Bank", "Rajshahi", 1, "01770807108", 006, "B+_01R", 006, "RBB-01");
INSERT INTO BLOOD_BANK VALUES("Rangpur Blood Bank", "Rangpur", 2, "01988877800", 007, "AB+_01RN", 007, "RNBB-01");
INSERT INTO BLOOD_BANK VALUES("Sylhet Blood Bank", "Sylhet", 1, "01937591604", 008, "AB+_01S", 008, "SBB-02");
INSERT INTO BLOOD_BANK VALUES("Mymensingh Blood Bank", "Mymensingh", 1, "01521443904", 009, "B+_02M", 009, "MBB-02");
INSERT INTO BLOOD_BANK VALUES("Dhaka Blood Bank", "Dhaka", 2, "01714010869", 010, "B+_02", 010, "DBB-03");
INSERT INTO BLOOD_BANK VALUES("Sylhet Blood Bank", "Sylhet", 2, "01937591604", 011, "AB+_02S", 011, "SBB-03");
INSERT INTO BLOOD_BANK VALUES("Chittagong Blood Bank", "Chittagong", 1, "01837690914", 012, "A+_01C", 012, "CBB-01");

-- -----------------------------------------------------
-- Table `plasma_bank_management_system`.`donor_medical_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plasma_bank_management_system`.`donor_medical_history` (
  `His_Id` INT NOT NULL,
  `Donor_Age` INT NOT NULL,
  `HB_Count` VARCHAR(10) NULL DEFAULT NULL,
  `WBC_Count` VARCHAR(10) NULL DEFAULT NULL,
  `RBC_Count` VARCHAR(10) NULL DEFAULT NULL,
  `Is_Diabetic` VARCHAR(5) NULL DEFAULT NULL,
  `Is_Alcoholic` VARCHAR(5) NULL DEFAULT NULL,
  `Height` VARCHAR(10) NULL DEFAULT NULL,
  `Weight` VARCHAR(10) NULL DEFAULT NULL,
  `Covid19_Recovery_Date` DATE NOT NULL,
  PRIMARY KEY (`Covid19_Recovery_Date`),
  INDEX `His_Id_idx` (`His_Id` ASC) VISIBLE,
  CONSTRAINT `His_Id`
    FOREIGN KEY (`His_Id`)
    REFERENCES `plasma_bank_management_system`.`donor` (`Donor_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO DONOR_MEDICAL_HISTORY VALUES(001, 36, "14.5", "7.5*10^9", "5.2", "No", "Yes", "159cm", "72kg", STR_TO_DATE('2020-06-19','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(002, 33, "13.2", "6.2*10^9", "4.8", "No", "No", "161cm", "66kg", STR_TO_DATE('2020-08-25','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(003, 31, "15.5", "9.5*10^9", "5.9", "No", "No", "154cm", "82kg", STR_TO_DATE('2020-05-13','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(004, 45, "12.5", "8.6*10^9", "6.0", "Yes", "Yes", "172cm", "72kg", STR_TO_DATE('2020-07-15','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(005, 24, "14.6", "7.8*10^9", "4.7", "No", "Yes", "166cm", "60kg", STR_TO_DATE('2020-09-17','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(006, 41, "16.2", "10.6*10^9", "5.1", "Yes", "No", "149cm", "75kg", STR_TO_DATE('2020-06-27','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(007, 32, "15.6", "8.6*10^9", "4.7", "Yes", "Yes", "154cm", "59kg", STR_TO_DATE('2020-06-16','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(008, 34, "13.9", "5.7*10^9", "4.8", "No", "No", "160cm", "79kg", STR_TO_DATE('2020-06-23','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(009, 25, "12.9", "6.2*10^9", "6.1", "No", "Yes", "170cm", "62kg", STR_TO_DATE('2020-07-11','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(010, 28, "13.2", "8.3*10^9", "4.9", "No", "Yes", "154cm", "70kg", STR_TO_DATE('2020-08-20','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(011, 32, "15.3", "9.4*10^9", "5.7", "No", "No", "162cm", "74kg", STR_TO_DATE('2020-07-09','%Y-%m-%d'));
INSERT INTO DONOR_MEDICAL_HISTORY VALUES(012, 30, "14.7", "5.9*10^9", "6.5", "No", "Yes", "156cm", "68kg", STR_TO_DATE('2020-05-22','%Y-%m-%d'));
