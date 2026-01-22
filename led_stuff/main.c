//#define constant 100000000

#define constant 5
int main(){
    volatile int counter = 0;
    volatile int b=0;
    volatile int* p = (int*)0x0;

    while(1){
        if(counter==constant){
            counter=0;
           b=!b;
           *p=b;
        }
        counter++;
    }
}