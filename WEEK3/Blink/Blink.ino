int PB0 = 22 , PB1 = 23 , LED =5 ;
int State =1;
void setup() {
  pinMode(PB0 , INPUT);
  pinMode(PB1 , INPUT_PULLUP);
  pinMode(LED , OUTPUT);
 Serial.begin(9600);
}

void loop() {

      if(digitalRead(PB0) == HIGH)State*=-1;
      Serial.println(digitalRead(PB0));
      if(State == 1){
        digitalWrite(LED,HIGH);
       
        delay(250);
        digitalWrite(LED,LOW);
      
        delay(250);
        } 
        if(State == -1){
          digitalWrite(LED,HIGH);
        
          }
      

}
