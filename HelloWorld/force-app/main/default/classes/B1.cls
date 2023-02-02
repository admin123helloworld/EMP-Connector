public class B1 extends Parent {
    public integer d=10;
    
    public override void display(){
        integer q=d+a;
        system.debug('I am from B1 class '+q);
        system.debug('I am Parent from class');
    }
}