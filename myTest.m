classdef myTest < matlab.unittest.TestCase
    methods(Test)
        function testL1normofOnes(testCase)
            actSolution = myPNorm(ones(10,1),1);
            expSolution = 10;
            testCase.verifyEqual(actSolution,expSolution)
        end
        function testL1normofRandomValue(testCase)
            for i = 1:10000
                inputarg = rand(100,1);
                actSolution = myPNorm(inputarg,1);
                expSolution = norm(inputarg,1);
                testCase.verifyLessThanOrEqual(abs(actSolution-expSolution),eps(1000))
            end
        end
        
        function testL2normofOnes(testCase)
            actSolution = myPNorm(ones(10,1),2);
            expSolution = sqrt(10);
            testCase.verifyLessThanOrEqual(abs(actSolution-expSolution),eps(10))
        end
        function testL2normofRandomValue(testCase)
            for i = 1:10000
                inputarg = rand(100,1);
                actSolution = myPNorm(inputarg,2);
                expSolution = norm(inputarg,2);
                testCase.verifyLessThanOrEqual(abs(actSolution-expSolution),eps(1000))
            end
        end
        
        function testLpnormofRandomValue(testCase)
            for i = 1:10000
                inputarg = rand(100,1);
                inputp = ceil(rand*100);
                actSolution = myPNorm(inputarg,inputp);
                expSolution = norm(inputarg,inputp);
                testCase.verifyLessThanOrEqual(abs(actSolution-expSolution),eps(1000))
            end
        end
        
        function testNonNumericInput(testCase)
            testCase.verifyError(@()myPNorm('-3',1),'myPNorm:InputargsMustBeNumeric')
            testCase.verifyError(@()myPNorm(-3,'1'),'myPNorm:InputargsMustBeNumeric')
            testCase.verifyError(@()myPNorm(ones(3),1),'myPNorm:VectorNormError')
            testCase.verifyError(@()myPNorm(ones(3,1),3.5),'myPNorm:pError')
            testCase.verifyError(@()myPNorm(ones(3,1),0),'myPNorm:pError')
        end
    end
end