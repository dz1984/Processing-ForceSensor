class  FSR {
  public int reading;
  public int totalV = 5000;
  public long fixR = 10000000;
  public int bound = 20; 
  private double fsrV = 0;
  private double fsrR = 0;
  private double fsrC = 0;
  private double fsrF = 0;
  private double fsrN = 0;
  public String name = "None";

  public FSR(String name, int reading) {
    this.name = name;
    this.reading = reading;
    this.fixR = fixR;
    this.totalV = totalV;
    this.fsrV = map(this.reading, 0, 1023, 0, this.totalV);
    this.fsrR = this.fixR*(this.totalV/this.fsrV);
    this.fsrC = 1000000/this.fsrR;
    if (this.fsrR>250000000)
      this.fsrF = this.fsrC/0.002;
    else
      this. fsrF =( this.fsrC-0.0012)/0.00014;
    this.fsrN = this.fsrF*4.4;
  }

  public void setTotalV(int totalV) {
    this.totalV = totalV;
  }

  public void setFixR(long fixR) {
    this.fixR = fixR;
  }

  public double getV() {
    return this.fsrV;
  }

  public double getR() {
    return this.fsrR;
  }

  public double getC() {
    return this.fsrC;
  }

  public double getF() {
    return this.fsrF;
  }

  public double getN() {
    return this.fsrN;
  }

  public void update() {
    text(this.getName(),0,10);
    rect(0,20,this.getBarWidth((float)this.getN()/4.4),5);
    System.out.println(this.toString());
  }

  public String getName() {
    return this.name;
  }
  
  public String toString() {
    return this.getName()+'\n'+str((float)this.getF()) + "N\n";
  }
  private float getBarWidth(float percent){
    return (width-this.bound)*percent/100;
  }
}

