@isTest
public class AnimalLocatorTest {
    @isTest static void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(2);
        String expectedResult = 'bear';
        System.assertEquals(result, expectedResult);
    }
}