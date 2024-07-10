#![allow(dead_code)]

use std::{ops::Add, str::FromStr};

use itertools::Itertools;

const INPUT: &str = r#"
R 6 (#70c710)
D 5 (#0dc571)
L 2 (#5713f0)
D 2 (#d2c081)
R 2 (#59c680)
D 2 (#411b91)
L 5 (#8ceee2)
U 2 (#caa173)
L 1 (#1b58a2)
U 2 (#caa171)
R 2 (#7807d2)
U 3 (#a77fa3)
L 2 (#015232)
U 2 (#7a21e3)
"#;

#[derive(Debug, Clone, Copy)]
enum Direction {
    Up,
    Down,
    Left,
    Right,
}

impl Add<Instruction> for (i32, i32) {
    type Output = Self;

    fn add(self, rhs: Instruction) -> Self::Output {
        match rhs.dir {
            Direction::Up => (self.0, self.1 - rhs.len as i32),
            Direction::Down => (self.0, self.1 + rhs.len as i32),
            Direction::Left => (self.0 - rhs.len as i32, self.1),
            Direction::Right => (self.0 + rhs.len as i32, self.1),
        }
    }
}

impl TryFrom<char> for Direction {
    type Error = ();

    fn try_from(value: char) -> Result<Self, Self::Error> {
        Ok(match value {
            'U' => Self::Up,
            'D' => Self::Down,
            'L' => Self::Left,
            'R' => Self::Right,
            _ => return Err(()),
        })
    }
}

#[derive(Debug, Clone, Copy)]
struct Instruction {
    dir: Direction,
    len: u16,
}

impl FromStr for Instruction {
    type Err = ();

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let [dir, len, _] = s.split(' ').collect::<Vec<_>>()[..] else {
            return Err(());
        };
        let dir = dir.chars().next().ok_or(())?.try_into()?;
        let len = len.parse().map_err(|_| ())?;
        Ok(Instruction { dir, len })
    }
}

fn main() {
    let input = INPUT.trim().to_string();

    let mut instructions: Vec<Instruction> = Vec::new();

    for line in input.lines() {
        instructions.push(line.parse().unwrap())
    }

    let vertices = instructions
        .iter()
        .scan((0, 0), |a, &b| {
            *a = *a + b;
            Some(*a)
        })
        .collect_vec();

    let mut edges = Vec::new();
    let mut prev = (0, 0);

    for Instruction { dir, len } in instructions {
        for _ in 0..len {
            let next = prev + Instruction { dir, len: 1 };
            edges.push(next);
            prev = next;
        }
    }

    let (lower_bounds, upper_bounds) = vertices.iter().fold(
        ((i32::MAX, i32::MAX), (i32::MIN, i32::MIN)),
        |(min, max), &new| {
            (
                (min.0.min(new.0), min.1.min(new.1)),
                (max.0.max(new.0), max.1.max(new.1)),
            )
        },
    );

    let all_points = itertools::iproduct!(
        lower_bounds.0..=upper_bounds.0,
        lower_bounds.1..=upper_bounds.1
    )
    .collect_vec();

    println!("{all_points:?}");
}
