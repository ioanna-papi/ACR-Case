use DB104;

CREATE PROCEDURE GetCustomer (
@code INT,	--Input parameter, code from each Customer
@fullname VARCHAR(50) OUT, --Output parameters
@phone INT OUT,
@c_address VARCHAR(50) OUT,
@dep_code INT OUT

)
AS
BEGIN
SELECT @fullname = fullname, @phone = phone, @c_address = c_address, @dep_code = dep_code
FROM Customer
WHERE @code = code
END

/*DROP PROCEDURE GetCustomer; */

