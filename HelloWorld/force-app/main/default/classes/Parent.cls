public virtual class Parent{
    public integer a=20, b=10;
    
    public virtual void display() {
        integer c=a+b;
        system.debug('I am Parent from class');
    }
}