

int main()
{
  int a[3][3]={1,2,3,4,5,6,7,8,9};
  int b[3][3]={1,2,3,4,5,6,7,8,9};
  int multiply[3][3];
  int sum=0;

   for (int c = 0; c < 3; c++) 
   {
      for (int d = 0; d < 3; d++) 
      {
          sum=0;
        for (int k = 0; k < 3; k++) 
        {
          sum = sum + a[c][k]*b[k][d];
        }
 
        multiply[c][d] = sum;
        sum = 0;
      }
    }

   
}
