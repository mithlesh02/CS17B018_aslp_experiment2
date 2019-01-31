

int main()
{

   int n=2;
   int count=0;
    
  while(n<=100)
  {
     
 
  if(n==2 || n==3)
  {
    count++;
   
  }
  
     int t=2;
     
     
     while(n>3)
     {
        
        if(n%t==0)
        break;
        
        if(t==n/2)
        {
            count++;
           
            break;
        }
         
         t++;
     }
  
     n++;
  
  }
 
}
