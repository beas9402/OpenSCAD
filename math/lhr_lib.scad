/**************************************************************************************************
* 𝘓𝘪𝘯𝘦𝘢𝘳 𝘏𝘰𝘮𝘰𝘨𝘦𝘯𝘰𝘶𝘴 𝘙𝘦𝘤𝘶𝘳𝘳𝘢𝘯𝘤𝘦 (𝘓𝘏𝘙) of degree 𝑘 with constant coefficients and intial values
*   Given:
*       𝑎 is a list containing 𝑛 values
*       𝒸 is a list containing 𝑘 constant coefficients [𝒸₀, 𝒸₁, 𝒸₂, …, 𝒸ₖ₋₁]
*       𝑖 is a list containing 𝑘 initial values        [𝑎₀, 𝑎₁, 𝑎₂, …, 𝑎ₖ₋₁]
*       𝑘 is LHR degree, number of elements in both 𝒸 and 𝑖, where 1 <= 𝑘 < ∞
*       𝑛 is number of elements in 𝑎, where 0 <= 𝑛 < ∞
*
*   Then:
*       For any 𝑎 with 𝑛 values
*       If 𝑛 < 𝑘 we can lookup the 𝑛ᵗʰ element of 𝑎 from 𝑖
*           𝑎ₙ = 𝑖[𝑛]
*       Otherwise the 𝑛ᵗʰ element of 𝑎 is calculated as follows:
*           𝑎ₙ = 𝒸₀𝑎ₙ₋₁ + 𝒸₁𝑎ₙ₋₂ + 𝒸₂𝑎ₙ₋₃ + … + 𝒸ₖ𝑎ₙ₋ₖ
*       Finally the new list 𝑎′ is created by appending 𝑎ₙ to the end
*           𝑎′ = [𝑎, 𝑎ₙ]
*
*   FYI:
*       This code uses the 𝘝𝘦𝘤𝘵𝘰𝘳 𝘋𝘰𝘵 𝘗𝘳𝘰𝘥𝘶𝘤𝘵 𝘖𝘱𝘦𝘳𝘢𝘵𝘰𝘳: '*'
*           When: 𝑥 and 𝑦 are vectors of equal length 𝑘
*                 𝑥*𝑦 = ∑𝑥ᵢ𝑦ᵢ = 𝑥₀𝑦₀ + 𝑥₁𝑦₁+ … + 𝑥ₖ₋₁𝑦ₖ₋₁
*
*   REFERENCES:
*       𝘩𝘵𝘵𝘱𝘴://𝘸𝘸𝘸.𝘦𝘦𝘤𝘴.𝘺𝘰𝘳𝘬𝘶.𝘤𝘢/𝘤𝘰𝘶𝘳𝘴𝘦_𝘢𝘳𝘤𝘩𝘪𝘷𝘦/2007-08/𝘍/1019/𝘈/𝘳𝘦𝘤𝘶𝘳𝘳𝘦𝘯𝘤𝘦.𝘱𝘥𝘧 (Section 4.1 on page 12)
*       𝘩𝘵𝘵𝘱𝘴://𝘦𝘯.𝘸𝘪𝘬𝘪𝘣𝘰𝘰𝘬𝘴.𝘰𝘳𝘨/𝘸𝘪𝘬𝘪/𝘖𝘱𝘦𝘯𝘚𝘊𝘈𝘋_𝘜𝘴𝘦𝘳_𝘔𝘢𝘯𝘶𝘢𝘭/𝘔𝘢𝘵𝘩𝘦𝘮𝘢𝘵𝘪𝘤𝘢𝘭_𝘖𝘱𝘦𝘳𝘢𝘵𝘰𝘳𝘴#𝘝𝘦𝘤𝘵𝘰𝘳_𝘥𝘰𝘵-𝘱𝘳𝘰𝘥𝘶𝘤𝘵_𝘰𝘱𝘦𝘳𝘢𝘵𝘰𝘳
*       𝘩𝘵𝘵𝘱𝘴://𝘦𝘯.𝘸𝘪𝘬𝘪𝘱𝘦𝘥𝘪𝘢.𝘰𝘳𝘨/𝘸𝘪𝘬𝘪/𝘋𝘰𝘵_𝘱𝘳𝘰𝘥𝘶𝘤𝘵
*
***************************************************************************************************/


/*********************************************************************************
  function next_LHR()
    Get the next number in a 𝘓𝘪𝘯𝘦𝘢𝘳 𝘏𝘰𝘮𝘰𝘨𝘦𝘯𝘰𝘶𝘴 𝘙𝘦𝘤𝘶𝘳𝘳𝘢𝘯𝘤𝘦 (𝘓𝘏𝘙)
        𝑎 is a list containing 𝑛 values 
        𝑖 is a list containing 𝑘 initial values        [𝑎₀, 𝑎₁, 𝑎₂, …, 𝑎ₖ₋₁]
        𝒸 is a list containing 𝑘 constant coefficients [𝒸₀, 𝒸₁, 𝒸₂, …, 𝒸ₖ₋₁]
        Both 𝒸 and 𝑖 must be the same degree (size) to use 𝘝𝘦𝘤𝘵𝘰𝘳 𝘋𝘰𝘵 𝘗𝘳𝘰𝘥𝘶𝘤𝘵 𝘖𝘱𝘦𝘳𝘢𝘵𝘰𝘳
    
         
    *** Warning ****
        Does NOT check the validity of the elements already in the sequence.
*********************************************************************************/
function next_LHR( a = [    ], // Sequence so far
                   i = [0, 1], // Inital Values
                   c = [1, 1]) // Constant Coeffiecients
// BEGIN next_LHR ---------//
=(
    let
    (
        // n is the number of elements in 𝑎, where 0 <= 𝑛 < ∞
        // 𝑘 is the degree of 𝘓𝘏𝘙 given 𝒸 and 𝑖, where 1 <= 𝑘 < ∞
        n = len(a),
        k = len(c),
        // verify we have same degree for 𝒸 and 𝑖
        _ = assert( k == len(i))
    )
    
    // Can 𝑎ₙ be looked up in 𝑖
        n < k   ? 
    // Then 𝑎ₙ = 𝑖[𝑛]
        i[n]    : // 𝚁𝙴𝚃𝚄𝚁𝙽 - 𝑎ₙ from initial values lookup
    // Otherwise use the 𝘝𝘦𝘤𝘵𝘰𝘳 𝘋𝘰𝘵 𝘗𝘳𝘰𝘥𝘶𝘤𝘵 𝘖𝘱𝘦𝘳𝘢𝘵𝘰𝘳 to get 𝑎ₙ 
        let
        (
            start = n-k,
             tail = n-1,
                r = [ for (x = [tail:-1:start])   // Last 𝑘 values from 𝑎 in '𝑟'everse order
                           a[x]                 ] // 𝑟 == [ 𝑎ₙ₋₁, 𝑎ₙ₋₂, …, 𝑎ₙ₋ₖ ]
                    
        )
        //  Avoid more complicated recursion by using
        //  𝘝𝘦𝘤𝘵𝘰𝘳 𝘋𝘰𝘵 𝘗𝘳𝘰𝘥𝘶𝘤𝘵 𝘖𝘱𝘦𝘳𝘢𝘵𝘰𝘳: '*' to get the regression sum 𝑎ₙ
        //      DETAILS: see OpenSCAD reference in header
            c*r // 𝚁𝙴𝚃𝚄𝚁𝙽 𝑎ₙ = 𝒸*𝑟 = ∑𝒸ᵢ𝑟ᵢ = 𝒸₀𝑎ₙ₋₁ + 𝒸₁𝑎ₙ₋₂ + 𝒸₂𝑎ₙ₋₃ + … + 𝒸ₖ₋₁𝑎ₙ₋ₖ
); 
// END next_LHR -----------//


/*********************************************************************************
  function generate_LHR()
    Generate a list of 𝘓𝘪𝘯𝘦𝘢𝘳 𝘏𝘰𝘮𝘰𝘨𝘦𝘯𝘰𝘶𝘴 𝘙𝘦𝘤𝘶𝘳𝘳𝘢𝘯𝘤𝘦 (𝘓𝘏𝘙) with 𝑛 elements
      𝑛 is a positive integer, where 0 <= 𝑛 < ∞
      𝑖 = a list containing 𝑘 initial values        [𝑎₀, 𝑎₁, 𝑎₂, …, 𝑎ₖ₋₁]
      𝒸 = a list containing 𝑘 constant coefficients [𝒸₀, 𝒸₁, 𝒸₂, …, 𝒸ₖ₋₁]
      
      Recursively generates a list with 𝑛-1 elements until 𝑛 == 0
      When 𝑛 == 0 the recursion ends by returning an empty list [].
      The returned list is appended with the next value in the sequence,
      using function next_LHR().
      
      If asked to produce a list with 0 or less values returns an empty array
**********************************************************************************/
function generate_LHR(n = 2,
                      i = [0, 1],
                      c = [1, 1])
// BEGIN generate_LHR ------------//
=(
    // test validity of inputs
    assert( is_num(n) == true, str("'", n, "' is NOT a number"))
    assert(        n  <  1/0 , str("Cannot generate an Infinite seq"))
    assert(        n  >=  0  , str("Cannot generate a seq with '", n, "' members"))
    assert(  floor(n) ==  n  , str("Integer Exception --Cannot generate a seq with '", n, "' members"))

    // requested list with <= 0 elements
    n <= 0 ? [] : // 𝚁𝙴𝚃𝚄𝚁𝙽 empty list []

    // Otherwise first get sequence with 1 less element 
    let (
           // Recurse to get sequence with one less element
           a = generate_LHR(n-1, i, c)
        )
       // now we have a list of recurence numbers with 𝑛-1 elements (from recursion)
       // we can calculate the next number 𝑎ₙ and append it to list
       concat(a, next_LHR(a, i, c))
);
// END generate_LHR --------------//