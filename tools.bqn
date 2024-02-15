⟨JParse⇐Parse⟩←•Import "bqn-libs/json.bqn"
bfld←"./freq-user-data/data/"
xch←"binance/"
dfld←bfld∾xch
+´(@+10)(=) 1⊑•SH "ls"‿(bfld∾xch)
# Candle files in folder
Klfiles←{(@+10)((⊢-˜¬×+`)∘⍷⊔⊢) 1⊑•SH "ls"‿𝕩}
Klfiles dfld
# Extract base,quote,timeframe from file names
Xkfld←{(<'-'‿'_') ((⊢-˜¬×+`)∘∊˜⊔⊢)¨  ¯5↓¨ 𝕩}
3↑>kls←Xkfld Klfiles dfld

# Unique assets
 5↑  ⍷(⊑)¨ kls

# Unique timeframes
 ⍷(¯1⊸⊑)¨ kls
# Reconstruct the filename
Bqt2f← (∾∘⥊∘⍉("_"‿"-"‿".json")≍˜⊢)
Bqt2f ⟨"ALGO","USDT","1d"⟩
# Get assets with "1d"s only
cl_1d←⊑¨ (( "1d"⊸≡ ¯1⊸⊑)¨⊸/⊢)  kls
cl_1d ((<⊣)∾⊢)¨ (<"USDT"‿"1d")

# Check timestamps are ok for all assets
TS_ok←{
	kls←JParse •FChars 𝕩 
	1⊸=≠⍷1↓(»⊸-) ⊑¨kls
}
#ok_klines ← TS_ok¨ (bfld∾xch∾Bqt2f)¨ cl_1d ((<⊣)∾⊢)¨ (<"USDT"‿"1d")
# kline files with abnormal timestamps
#cl_1d
#((¬ok_klines) / cl_1d)
# Reconstruct filenames
#(<"_"‿"-"‿".json") (∾´∘⥊∘⍉≍˜)¨  cl_1d ∾ (<"USDT"‿"1d")
# Get all timeframes for ALGO only
(( "ALGO"⊸≡ 0⊸⊑)¨⊸/⊢) kls

fcl←bfld∾xch∾("_"‿"-"‿".json") (∾∘⥊∘⍉≍˜) ⟨"ALGO","USDT","1d"⟩
# Load klines
#5↑>kls←JParse •FChars fcl
# Check Differences between Timestamps are the same
#1⊸=≠⍷1↓(»⊸-) ⊑¨kls
#(( "1d"⊸≡ ¯1⊸⊑)¨⊸/⊢) bqtf





#>> 1⊏((⊐¯1⊸↑¨)⊸ ⊔) (<'-'‿'_') ((⊢-˜¬×+`)∘∊˜⊔⊢)¨  ¯5↓¨(@+10)((⊢-˜¬×+`)∘⍷⊔⊢) 1⊑•SH "ls"‿(bfld∾xch)





