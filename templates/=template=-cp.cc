/**
 * %FFILE%
 * Author: Libao Jin
 * Date: %FDATE%
 */

#include <bits/stdc++.h>

using namespace std;

#define debug(x) cerr << #x << " = " << x << '\n';

#define rep(i, begin, end)                   \
  for (auto i = (begin) - ((begin) > (end)); \
       i != (end) - ((begin) > (end));       \
       i += 1 - 2 * ((begin) > (end)))

static const auto _ = [](){
  ios::sync_with_stdio(false);
  cin.tie(nullptr);
  cout.precision(10);
  cout << fixed;
  return 0;
}();

#ifdef LOCAL
ifstream fin("%FILE%.in");
ofstream fout("%FILE%.out");
#define cin fin
#define cout fout
#endif

void solve() {
  %HERE%
  cout << '\n';
}

int main(int argc, char* argv[]) {
  int T;
  cin >> T;
  for (int t = 1; t <= T; ++t) {
    solve();
  }
  return 0;
}
