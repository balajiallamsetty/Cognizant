/* ==========================================
   Exercise 5
   Return Data From Stored Procedure
========================================== */

-- Create Procedure

CREATE PROCEDURE GetEmployeeCountByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;

-- Execute Procedure

EXEC GetEmployeeCountByDepartment 3;