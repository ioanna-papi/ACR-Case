use DB104;

DECLARE @pnumber INT, @comp VARCHAR(15), @p_date DATE, @mod VARCHAR(15), @col VARCHAR(15), @c_cod INT ;

DECLARE car_fleet_cursor CURSOR FOR
SELECT *
FROM Car 

OPEN car_fleet_cursor;

FETCH NEXT FROM car_fleet_cursor
INTO @pnumber, @comp, @p_date, @mod, @col, @c_cod ;

WHILE @@FETCH_STATUS = 0
BEGIN
PRINT ('plate_number: ' + Cast(@pnumber as Varchar) + '  company: ' + @comp + '  purchase_date: ' +  Cast(@p_date as Varchar) + ' model: ' 
		+ @mod + '  colour: ' + @col + '  category: ' + Cast(@c_cod as Varchar) );

FETCH NEXT FROM car_fleet_cursor
INTO @pnumber, @comp, @p_date, @mod, @col, @c_cod ;

END

CLOSE car_fleet_cursor ;
DEALLOCATE car_fleet_cursor ;

