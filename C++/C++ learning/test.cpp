#include<bits/stdc++.h>
using namespace std;

void solve(){
    int n,x;
    cin >> n >> x;
    vector<int>a(n);x

    for(int &y : a){
        cin >> y;
    }
   
    for(auto ir=a.begin();ir != a.end();ir++){
        if(*ir%x != 0){
            continue;
        }
        for(int i=0;i<x;i++){
            a.push_back(*ir/x);
        }
    }

    cout << accumulate(a.begin(),a.end(),0) << endl;
}

int main() {
    int t;
    cin >> t;
    while(t--){
        solve();
    }
    return 0;
}


