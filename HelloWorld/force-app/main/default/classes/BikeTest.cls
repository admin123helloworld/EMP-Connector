@isTest
public class BikeTest {
    @isTest
    public static void testad(){
    integer result=Bike.add(10, 20); 
        system.assertEquals(30, result);
    }
    @isTest
    public static void testmulti(){
        integer result=Bike.multi(20, 30);
        system.assertEquals(600, result );
    }
    @isTest
    public static void testdivide(){
        integer result=Bike.divide(10, 2);
        system.assertEquals(5, result);
    }
    
}