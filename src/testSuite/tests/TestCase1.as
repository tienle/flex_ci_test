package testSuite.tests
{
	import flexunit.framework.*;
	
	public class TestCase1
	{
		public function TestCase1()
		{			
		}
		
		[Test(description="test addition method of testcase1")]
		public function addition():void {
			Assert.assertEquals(12, 5+5);			
		}
		
		[Test]
		public function subtraction():void {
			Assert.assertEquals(3, 2 + 1);
		}
		
		[Before]
		public function runBeforeEveryTest(): void {
			trace("before");
		}
		
		[After]
		public function runAfterEveryTest(): void {
			trace("after");
		}
	}
}