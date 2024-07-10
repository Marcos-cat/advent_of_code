fn main() {
    let x: i64 = (1..=1_000_000_000i64).map(|n| n * 2).sum();
    println!("{x}");
}

