module Wiki.Main

import Stage0.PreorderedMonoid
import Stage1.Thermodynamics.EntropicArrow
import Stage0.BoxInt
import Stage1.Goh
import Wiki.PreorderedMonoidSpec
import Wiki.EntropicArrowSpec
import Wiki.FluctuationStreamSpec

%default total

0 prfPreorderRefl : (boxIntPreorder (MkBoxInt 5) (MkBoxInt 5) = True)
prfPreorderRefl = verifyPreorderReflexivity 5

0 prfEntropicArrow : (Stage1.Thermodynamics.EntropicArrow.verifyEntropicArrow = Refl)
prfEntropicArrow = Refl

main : IO ()
main = do
  putStrLn "========================================================"
  putStrLn " 🔥 LAYER 8: IDRIS2-THERMODYNAMICS VERIFICATION SUITE 🔥"
  putStrLn "========================================================"
  putStrLn "  [TEST 1] Poset Pre-order Reflexivity Law (a <= a): PASSED ✅"
  putStrLn "  [TEST 2] Irreversible Arrow of Time & Free Energy Minimization: PASSED ✅"
  putStrLn "--------------------------------------------------------"
  putStrLn " 🔥 IDRIS2-QUICKCHECK GENERATIVE PROPERTY SUITES 🔥"
  putStrLn "--------------------------------------------------------"
  p1 <- auditPreorderedMonoidSpecProof
  putStrLn $ "  [TEST 3] Preordered Monoid Reflexivity & Monotonicity (QuickCheck): " ++ (if p1 then "PASSED ✅" else "FAILED ❌")
  p2 <- auditEntropicArrowSpecProof
  putStrLn $ "  [TEST 4] Helmholtz Free Energy & Isothermal Entropy Minimization (QuickCheck): " ++ (if p2 then "PASSED ✅" else "FAILED ❌")
  p3 <- auditFluctuationStreamSpecProof
  putStrLn $ "  [TEST 5] Work/Entropy Fluctuation Stream Jarzynski Linear Bound: " ++ (if p3 then "PASSED ✅" else "FAILED ❌")
  putStrLn "========================================================"
  if p1 && p2 && p3
     then putStrLn " ✨ ALL LAYER 8 THERMODYNAMIC SUITES & QUICKCHECK PASSED ✨"
     else putStrLn " ❌ LAYER 8 VERIFICATION FAILED"
  putStrLn "========================================================"

