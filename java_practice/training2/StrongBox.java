package java_practice.training2;

public class StrongBox<E> {
    private E data;
    private int countPadLock;
    private int countButton;
    private int countDial;
    private int countFinger;
    private KeyType keyType;

    public StrongBox(KeyType kType){
        this.keyType = kType;
    }

    public void put(E d){ this.data = d; }
    public E get(){  
        if(this.keyType == KeyType.PADLOCK && this.countPadLock < 1024){
            countPadLock++;
            return null;
        }else if(this.countPadLock >= 1024){
            return this.data;
        }
        
        if(this.keyType == KeyType.BUTTON && this.countButton < 10000){
            countButton++;
            return null;
        }else if(this.countButton >= 10000){
            return this.data;
        } 
        
        if(this.keyType == KeyType.DIAL && this.countDial < 30000){
            countDial++;
            return null;
        }else if(this.countDial >= 30000){
            return this.data;
        }
        
        if(this.keyType == KeyType.FINGER && this.countFinger < 1000000){
            countFinger++;
            return null;
        }else if(this.countFinger >= 1000000){
            return this.data;
        }
        return null;
    }

}
