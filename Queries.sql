-- All Donor Information With His Medical History:
select * from donor join donor_medical_history
where Donor_Id = His_Id;

-- All Patient Information:
select * from plasma_receiver;

-- Blood Bank Information:
select * from blood_bank;

-- Hospital List:
select distinct(Hospital_Name), Address, Contact_No
from hospital;

-- Which Patient Is From Which Hospital & Their Blood Group and Plasma Id:
select p.Patient_Name, h.Hospital_Name, h.Address, p.Blood_Group, h.Plasma_Id
from hospital as h join plasma_receiver as p
where p.Patient_Id = h.Patient_Id;

-- Donor Name, Address, Blood Group & Covid-19 Recovery Date:
select d.Donor_Name, d.Address, d.Blood_Group, m.Covid19_Recovery_Date
from donor as d join donor_medical_history as m
where d.Donor_Id = m.His_Id;

-- Patient Name Associative With Their Required Plasma Group:
select Patient_Name, Blood_Group, Address, Phone_Number
from plasma_receiver;

-- Available Donor's Number For Different Blood Group:
select Blood_Group, count(Blood_Group) as "Available Donors"
from donor
group by Blood_Group;

-- Available Donors From Distinct Address
select Address, count(Address) as "Donor's Number"
from donor
group by Address;

-- Updating Donor's Wrong Information:
-- Suppose Muminul Islam Is From Mymensingh But IT Person Listed Him That He Is From Sylhet. So He Has To Update It.
UPDATE donor
SET Address = "Mymensingh"
WHERE Donor_Id = '5';
-- So, Here is the Updated Donor List:
select * from donor;

-- Updating Patient's Wrong Information:
-- Suppose Forhad Alam's Blood Group Is "B-" But IT Person Inserted The Wrong Information. So He Has To Update It.
UPDATE plasma_receiver
SET Blood_Group = "B-"
WHERE Patient_Id = '4';

-- Find Any Patient Who's Name Contains "Islam":
select * from plasma_receiver
WHERE Patient_Name LIKE '%Islam%';

-- Joining Patient With Hospital:
select p.Patient_Name, p.Address, h.Hospital_Name
from plasma_receiver as p Join hospital as h
where h.Patient_Id = p.Patient_Id;

-- Finding Donor's Information Using Subqueries:
select Donor_Name, Address, Contact_No, Blood_Group
from donor
where Blood_Group = (select Blood_Group
                     from donor
					 where Donor_Id = "5");
-- Adding A Column In A Table
ALTER TABLE plasma_receiver
ADD (Medical_History VARCHAR(50));

-- Deleting Information From Table:
DELETE FROM blood_bank
WHERE Donor_Id = '10';