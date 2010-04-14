package testSuite.FlexMonkeyTestSuite{
    import com.gorillalogic.flexmonkey.flexunit.tests.MonkeyFlexUnitTestSuite;

    import testSuite.FlexMonkeyTestSuite.tests.NewTestCase;

    public class FlexMonkeyTestSuite extends MonkeyFlexUnitTestSuite{
        public function FlexMonkeyTestSuite(){
            addTestCase(new NewTestCase());
        }
    }
}