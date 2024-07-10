struct Lens {
    label: String,
    focal_length: usize,
}

impl Lens {
    fn parse(lens: String) -> Option<Self> {
        let [label, focal_len] = lens.split('=').collect::<Vec<_>>()[..] else {
            return None;
        };

        Some(Lens {
            label: label.into(),
            focal_length: focal_len.parse().ok()?,
        })
    }
}

fn main() {
    let input =
        "rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7".to_string();

    let instructions: Vec<_> = input.split(',').map(String::from).collect();
    let _boxes: Vec<Vec<(String, u8)>> =
        [Vec::new()].iter().cycle().take(256).cloned().collect();

    for instruction in instructions {
        match Lens::parse(instruction) {
            Some(lens) => {
                let hash = hash(&lens.label);
                _boxes[hash].
            }
            None => {}
        }
    }
}

fn hash(string: &str) -> usize {
    string
        .as_bytes()
        .iter()
        .fold(0, |acc, new| ((acc + *new as usize) * 17) % 256)
}
