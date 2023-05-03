
// import foo;
function add(x,y) {
    return x+y;
}

function multi(x,y) {
    return x*y;
}
z =  add(2,3) + multi(3,2); // 11


function factoriel(n) {
    if(n==0){
        return 1;
    }else{
        return n*factoriel(n-1);
    }
}

fact5 = factoriel(5); //120
