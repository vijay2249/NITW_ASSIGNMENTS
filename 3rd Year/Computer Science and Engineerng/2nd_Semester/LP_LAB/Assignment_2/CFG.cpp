#include <bits/stdc++.h>

using namespace std;

// this is used to store the grammar rules
map<string, vector<vector<string>>> grammar;
string start;

// this function adds a rule to the grammar and clears the rule
void addrule(string nt, vector<string> &rule){
  grammar[nt].push_back(rule);
  rule.clear();
}

// print the rule
void printrule(string left, vector<string> rule){
  cout << left << " -> ";
  if (rule.empty()) cout << "null";
  for (string symbol : rule) cout << symbol << " ";
  cout << endl;
}

// print the grammar
void printgrammar(){
  for (auto ruleset : grammar){
    string left = ruleset.first;
    vector<vector<string>> &rules = ruleset.second;
    for (auto rule : rules) printrule(left, rule);
  }
}

// this function checks if given symbol is terminal or not
bool isterminal(string symbol){
  if (isupper(symbol[0])) return false;
  else return true;
}

// gets terminals, non-terminals and deriving symbols
void getsymboldesc(set<string> &derivings, set<string> &nonterminals, set<string> &terminals){
  terminals.clear();
  nonterminals.clear();
  derivings.clear();
  for (auto &ruleset : grammar){
    derivings.insert(ruleset.first);
    // get the set of rules derived by the deriving symbol
    vector<vector<string>> &rules = ruleset.second;
    for (auto &rule : rules){
      for (auto symbol : rule){
        if (isterminal(symbol)) terminals.insert(symbol);
        else nonterminals.insert(symbol);
      }
    }
  }
}

// this function removes useless symbols
void removeuselesssymbols(){
  set<string> nonterminals, terminals, derivings;
  getsymboldesc(derivings, nonterminals, terminals);
  for (auto s : derivings){
    if (grammar.count(s) and !grammar[s].size())
      grammar.erase(s);
  }
}

// This function check if all symbol of given rule are already in nullable
bool ispresent(vector<string> rule, set<string> nullable){
  for (auto sym : rule){
    if (!nullable.count(sym))
      return false;
  }
  return true;
}

// This function removes all null productions ( A -> null)
void removenullproductions(){
  set<string> nonterminals, terminals, derivings, nullable;
  getsymboldesc(derivings, nonterminals, terminals);

  for (auto nt : nonterminals){
    if (grammar.count(nt)){
      vector<vector<string>> &rules = grammar[nt];
      for (auto &rule : rules){
        if (rule.size() == 0)
          nullable.insert(nt);
      }
    }
  }
  set<string> nullnew = nullable;
  while (1){
    for (auto nt : nonterminals){
      if (grammar.count(nt)){
        vector<vector<string>> &rules = grammar[nt];
        for (auto &rule : rules){
          if (rule.size() != 0 and !nullnew.count(nt) and ispresent(rule, nullnew))
            nullnew.insert(nt);
        }
      }
    }
    if (nullnew.size() <= nullable.size()) break;
    nullable = nullnew;
  }

  // Now generate new rules using nullables
  for (auto nul : nullable){
    for (auto &ruleset : grammar){
      string left = ruleset.first;
      vector<vector<string>> &rules = ruleset.second;
      for (int i = 0; i < rules.size(); i++){
        for (int j = 0; j < rules[i].size(); j++){
          if (rules[i][j] == nul){
            vector<string> newrule = rules[i];
            newrule.erase(newrule.begin() + j);
            addrule(left, newrule);
          }
        }
      }
    }
  }

  // Now remove all NULL rules
  for (auto &ruleset : grammar){
    vector<vector<string>> &rules = ruleset.second;
    for (int i = 0; i < rules.size(); i++){
      if (rules[i].size() == 0){
        rules.erase(rules.begin() + i);
        i--;
      }
    }
  }
  removeuselesssymbols();
}

void removeunitproductions(){
  map<string, set<string>> unitproductions, unitnew;
  set<string> nonterminals, terminals, derivings;
  getsymboldesc(derivings, nonterminals, terminals);

  for (auto nt : nonterminals) unitproductions[nt].insert(nt);

  // Find all unit productions
  unitnew = unitproductions;
  while (1){
    unitproductions = unitnew;
    for (auto &ruleset : grammar){
      string left = ruleset.first;
      vector<vector<string>> &rules = ruleset.second;
      for (auto rule : rules){
        if (rule.size() == 1 && rule[0] != left && !isterminal(rule[0])){
          // if unit production found
          // Terminals and Rules like A->A not included as unit productions
          string symbol = rule[0];
          for (auto unit : unitproductions[symbol])
            unitnew[left].insert(unit);
        }
      }
    }
    if (unitproductions == unitnew) break;
  }
  // Now remove all unit productions from grammar
  for (auto &ruleset : grammar){
    vector<vector<string>> &rules = ruleset.second;
    for (int i = 0; i < rules.size(); i++){
      if (rules[i].size() == 1 && !isterminal(rules[i][0])){
        rules.erase(rules.begin() + i);
        i--;
      }
    }
  }

  removeuselesssymbols();
  for (auto unit : unitproductions){
    string left = unit.first;
    set<string> unitset = unit.second;
    for (auto symbol : unitset){
      if (symbol != left && grammar.count(symbol) > 0 && grammar[symbol].size() > 0){
        // check if not the same symbol then add all rules of symbol to deriving symbol
        for (auto rule : grammar[symbol])
          addrule(left, rule);
      }
    }
  }
}

bool isDigit(string s){
  for (auto n : s){
    if (!isdigit(n))
      return false;
  }
  return true;
}
// this function returns a new non-terminal
// that does not exist in grammar by modifying given symbol
string nextnonterminal(string symbol){
  set<string> nonterminals, terminals, derivings;
  getsymboldesc(derivings, nonterminals, terminals);
  string res;
  while (true){
    if (nonterminals.count(symbol) == 0) return symbol;
    int idx = symbol.find("_");
    if (idx == string::npos) res = symbol + "_1";
    else{
      if (isDigit(symbol.substr(idx + 1))){
        int num = stoi(symbol.substr(idx + 1));
        num++;
        res = symbol.substr(0, idx) + "_" + to_string(num);
      }
      else res = symbol + "_1";
    }
    symbol = res;
  }
  return res;
}

void removeleftrecursion(){
  set<string> nonterminals, terminals, derivings;
  getsymboldesc(derivings, nonterminals, terminals);
  vector<string> nonterminal = vector<string>(nonterminals.begin(), nonterminals.end());
  for (int i = 0; i < nonterminal.size(); i++){
    string nt = nonterminal[i];
    if (grammar.count(nt) > 0 && grammar[nt].size() > 0){
      for (int j = 0; j < i; j++){
        // replace each production of the form Ai-> Ajx by
        // prodcutions Ai -> a1 x | a2 x| .. | x
        // where Aj -> a1 | a2 | a3 are all current Aj productions
        string prev = nonterminal[j];
        vector<vector<string>> &rules = grammar[nt];
        for (int m = 0; m < rules.size(); m++){
          vector<string> rule = rules[m];
          // for each rule produced by non-terminal check if contains Aj at the start
          if (rule.size() > 0 && rule[0] == prev && grammar.count(prev) > 0 && grammar[prev].size() > 0){
            rules.erase(rules.begin() + m);
            rule.erase(rule.begin());
            for (auto other : grammar[prev]) other.insert(other.end(), rule.begin(), rule.end()), addrule(nt, other);
            m--;
          }
        }
      }
      vector<vector<string>> rules = grammar[nt];
      string newnt = nextnonterminal(nt);
      vector<vector<string>> terminations, nonterminations;
      for (auto rule : rules){
        if (rule.size() > 0 && rule[0] == nt){
          rule.erase(rule.begin());
          nonterminations.push_back(rule);
        }
        else terminations.push_back(rule);
      }
      if (nonterminations.size() > 0){
        grammar.erase(nt);
        for (auto rule : terminations){
          rule.push_back(newnt);
          addrule(nt, rule);
        }
        vector<string> emptyrule;
        addrule(newnt, emptyrule);
        for (auto rule : nonterminations){
          rule.push_back(newnt);
          addrule(newnt, rule);
        }
      }
    }
  }
  removenullproductions();
  removeunitproductions();
  removeuselesssymbols();
}

int main(){
  grammar.clear();
  int n;
  cout << "Enter No. of Production :- ";
  cin >> n;
  string x;
  getline(cin, x);
  for (int i = 0; i < n; i++){
    string s;
    // S -> A a | B b | c or S -> null
    getline(cin, s);
    vector<string> rule;
    stringstream ss(s);
    // to keet track of symbols
    string nextsymbol, ntnew, ntold;
    while (ss >> nextsymbol){
      if (nextsymbol == "->"){
        ntnew = rule.back();
        rule.pop_back();
        if (rule.empty()) addrule(ntold, rule);
        if (grammar.empty()) start = ntnew;
        // update the non-terminal
        ntold = ntnew;
      }
      else if (nextsymbol == "|"){
        if(!rule.empty()) addrule(ntold, rule);
      }
      else if (nextsymbol == "null"){
        rule.clear();
        addrule(ntold, rule);
      }
      else rule.push_back(nextsymbol);
    }
    if (!rule.empty()) addrule(ntold, rule);
  }
  removeuselesssymbols();
  cout << "After Removing Useless Rules :-" << endl;
  printgrammar();
  removenullproductions();
  cout << "After Removing Null Rules :-" << endl;
  printgrammar();
  removeunitproductions();
  cout << "After Removing Unit Productions :-" << endl;
  printgrammar();
  removeleftrecursion();
  cout << "After Removing Left Recursion :-" << endl;
  printgrammar();
}

/*
E -> ( E ) E_1
E -> T * F E_1
E -> T / F E_1
E -> id E_1
E_1 -> null
E_1 -> + T E_1
E_1 -> - T E_1
F -> ( E )
F -> id
T -> ( E ) T_1
T -> id T_1
T_1 -> null
T_1 -> * F T_1
T_1 -> / F T_1

E -> ( E ) E_1
E -> id E_1
E -> T * F E_1
E -> T / F E_1
E -> ( E )
E -> id
E -> T * F
E -> T / F
E_1 -> + T E_1
E_1 -> - T E_1
E_1 -> + T
E_1 -> - T
F -> ( E )
F -> id
T -> ( E ) T_1
T -> id T_1
T -> ( E )
T -> id
T_1 -> * F T_1
T_1 -> / F T_1
T_1 -> * F
T_1 -> / F
*/