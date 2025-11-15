//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    private static class MonthlyConstantCosts {
        protected static final int months = 12;
        protected static final double YOUTUBE = 9.99;
        protected static final double GOOGLE_ONE = 1.99;
        protected static final double CRUNCHY_ROLL = 5.99;
        protected static final double NOVA = 49.00;

        public void calculate() {
            double sumCosts = YOUTUBE + GOOGLE_ONE + CRUNCHY_ROLL + NOVA;
            double annualCost = months * sumCosts;

            System.out.println("The annual cost for monthly constant costs: " + annualCost);
        }
    }


    public static void main(String[] args) {
        MonthlyConstantCosts monthlyConstantCosts = new MonthlyConstantCosts();
        monthlyConstantCosts.calculate();
    }
}