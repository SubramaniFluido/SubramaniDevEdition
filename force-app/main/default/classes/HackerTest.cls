Public class HackerTest{
    public static Integer doubleNumber(List<Integer> numberLst, Integer sampleNumber){
        List<Integer> doubleLst= new List<Integer>();
        Integer newNumber= sampleNumber;
        numberLst.sort();
        for(Integer num: numberLst){
            if(num==newNumber){
                newNumber+=  newNumber;
            }
        }
        return newNumber;
    }
    public static List<Integer> nodeCalulation(List<Integer> numberLst, Integer sampleNumber){
        List<Integer> smallerNumberLst= new List<Integer>();
        for(Integer num: numberLst){
            if(num<=sampleNumber){
                smallerNumberLst.add(num);
            }
        }
        return smallerNumberLst;
    }

}