use std::str::FromStr;

use rayon::prelude::*;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Spring {
    Broken,
    Operational,
}
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum ManualItem {
    Unknown,
    Known(Spring),
}

#[derive(Debug)]
struct Manual {
    entries: Vec<ManualItem>,
    broken_count: Vec<u8>,
}

impl TryFrom<char> for ManualItem {
    type Error = ();

    fn try_from(value: char) -> Result<Self, Self::Error> {
        match value {
            '#' => Ok(Self::Known(Spring::Broken)),
            '.' => Ok(Self::Known(Spring::Operational)),
            '?' => Ok(Self::Unknown),
            _ => Err(()),
        }
    }
}

impl FromStr for Manual {
    type Err = ();

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let (entries, broken_count) = s.trim().split_once(' ').ok_or(())?;

        let entries = entries
            .chars()
            .map(ManualItem::try_from)
            .collect::<Result<_, _>>()?;

        let broken_count = broken_count
            .split(',')
            .map(str::parse)
            .collect::<Result<_, _>>()
            .map_err(|_| ())?;

        Ok(Self { entries, broken_count })
    }
}

impl Manual {
    fn solve(&self) -> u64 {
        let mut perms: Vec<Vec<Spring>> = vec![Vec::new()];

        for entry in &self.entries {
            match entry {
                ManualItem::Known(spring) => {
                    for perm in &mut perms {
                        perm.push(*spring);
                    }
                }
                ManualItem::Unknown => {
                    let mut fork = perms.clone();
                    for perm in &mut perms {
                        perm.push(Spring::Operational);
                    }
                    for perm in &mut fork {
                        perm.push(Spring::Broken);
                    }
                    perms.append(&mut fork);
                }
            }
        }

        let count = perms
            .par_iter()
            .map(|perm| {
                let mut counts: Vec<u8> = vec![0];
                for spring in perm {
                    match spring {
                        Spring::Broken => {
                            *counts.last_mut().unwrap() += 1;
                        }
                        Spring::Operational => {
                            if *counts.last().unwrap() != 0 {
                                counts.push(0);
                            }
                        }
                    }
                }

                if *counts.last().unwrap() == 0 {
                    counts.pop();
                }

                counts
            })
            .filter(|counts| counts == &self.broken_count)
            .count();

        count as u64
    }
}

fn main() {
    let file = std::fs::read_to_string("../input.txt").unwrap();

    let sum: u64 = file
        .lines()
        .par_bridge()
        .map(str::parse::<Manual>)
        .map(Result::unwrap)
        .map(|m| m.solve())
        .sum();

    println!("{sum}");
}
