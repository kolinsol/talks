function sum(l, col) {
    if (l.length === 0) return col(0);
    else return sum(l.slice(1), countedSum => col(l[0] + countedSum));
}

module.exports = sum;
