#!/bin/bash

# test1: Clean Data
# $1 = $2
echo "最大公約数は 6" >> /tmp/$$-ki_ans
./gcf.sh 6 6 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# $1 < $2
echo "最大公約数は 6" >> /tmp/$$-ki_ans
./gcf.sh 6 12 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# $1 >> $2
echo "最大公約数は 6" >> /tmp/$$-ki_ans
./gcf.sh 12 6 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# test2: 引数の数に問題あり
# 引数なし
echo "引数の数は２個としてください" >> /tmp/$$-ki_ans
./gcf.sh  >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# 引数１個
echo "引数の数は２個としてください" >> /tmp/$$-ki_ans
./gcf.sh 3 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# 引数３個以上
echo "引数の数は２個としてください" >> /tmp/$$-ki_ans
./gcf.sh 2 4 6 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# test3: Dirty Data - 数値以外を含む
# $1 に数値以外を含む
echo "引数に数字以外が含まれています" >> /tmp/$$-ki_ans
./gcf.sh 3a 12 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# $2 に数値以外を含む
echo "引数に数字以外が含まれています" >> /tmp/$$-ki_ans
./gcf.sh 6 a >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# 両方に数値以外を含む
echo "引数に数字以外が含まれています" >> /tmp/$$-ki_ans
./gcf.sh a3 6b >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# test4: Dirty Data - ゼロ
# $1 が 0
echo "引数にゼロは使えません" >> /tmp/$$-ki_ans
./gcf.sh 0 6 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# $2 が 0
echo "引数にゼロは使えません" >> /tmp/$$-ki_ans
./gcf.sh 6 0 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# 両方 0
echo "引数にゼロは使えません" >> /tmp/$$-ki_ans
./gcf.sh 0 0 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# test5: Dirty Data - 負
# $1 がマイナス
echo "引数にマイナスは使えません" >> /tmp/$$-ki_ans
./gcf.sh -2 6 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# $2 がマイナス
echo "引数にマイナスは使えません" >> /tmp/$$-ki_ans
./gcf.sh 6 -2 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# 両方マイナス
echo "引数にマイナスは使えません" >> /tmp/$$-ki_ans
./gcf.sh -2 -6 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# test6: Dirty Data - 小数
# $1 が小数
echo "引数に小数は使えません" >> /tmp/$$-ki_ans
./gcf.sh 1.2 6 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# $2 が小数
echo "引数に小数は使えません" >> /tmp/$$-ki_ans
./gcf.sh 2 6.1 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# 両方小数
echo "引数に小数は使えません" >> /tmp/$$-ki_ans
./gcf.sh 1.1 2.2 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# test7: Dirty Data - 64ビット整数(9223372036854775807)を超える値
# $1 が超過
echo "bashで扱える数値の上限を超えています" >> /tmp/$$-ki_ans
./gcf.sh 9223372036854775808 1 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# $2 が超過
echo "bashで扱える数値の上限を超えています" >> /tmp/$$-ki_ans
./gcf.sh 1 9223372036854775808 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# 両方超過
echo "bashで扱える数値の上限を超えています" >> /tmp/$$-ki_ans
./gcf.sh 9223372036854775808 9223372036854775808 >> /tmp/$$-ki_result
diff /tmp/$$-ki_ans /tmp/$$-ki_result || exit 1

# あとしまつ
rm /tmp/$$-ki*
