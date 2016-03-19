function Seq(seq) {
  this.seq = seq;
  this.index = 0;
}
Seq.prototype.next = function() {}
Seq.prototype.hasNext = function() {}

function ArraySeq(seq) {
  Seq.call(this, seq);
}
ArraySeq.prototype = Object.create(Seq.prototype);
ArraySeq.prototype.hasNext = function() {
  if (this.index < this.seq.length) {
    return true;
  }
  return false;
}
ArraySeq.prototype.next = function() {
  value = this.seq[this.index];
  this.index++;
  return value;
}

function RangeSeq(a, b) {
  Seq.call(this, [a, b]);
}
RangeSeq.prototype = Object.create(Seq.prototype);
RangeSeq.prototype.hasNext = function() {
  if (this.index + this.seq[0] < this.seq[1]) {
    return true;
  }
  return false;
}
RangeSeq.prototype.next = function() {
  value = this.seq[0] + this.index;
  this.index++;
  return value;
}

function logFive(sequence) {
  var n = 0;
  while (n < 5 && sequence.hasNext()) {
    console.log(sequence.next())
    n++;
  }
}

logFive(new ArraySeq([1, 2]));
// → 1
// → 2
logFive(new ArraySeq([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]));
// → 10
// → 9
// → 8
// → 7
// → 6
logFive(new RangeSeq(100, 1000));
// → 100
// → 101
// → 102
// → 103
// → 104
logFive(new RangeSeq(100, 102));
// → 100
// → 101
// → 102
