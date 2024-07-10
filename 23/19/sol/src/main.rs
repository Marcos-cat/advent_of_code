#![allow(dead_code)]

use once_cell::unsync::Lazy;
use regex::Regex;

struct Workflow {
    key: FlowKey,
    flows: Vec<Flow>,
    fallback: FlowKey,
}

impl Workflow {
    const MATCHER: Lazy<Regex> =
        Lazy::new(|| Regex::new(r"(\w+)\{(.+)\}").unwrap());
    const FALLBACK_MATCHER: Lazy<Regex> =
        Lazy::new(|| Regex::new(r",(\w+)$").unwrap());

    pub fn new(workflow: &str) -> Self {


        todo!()
    }
}

impl Workflow {}

struct Flow {
    field: Field,
    comparison: Comparison,
    number: u32,
    next: FlowKey,
}

impl Flow {
    const MATCHER: Lazy<Regex> =
        Lazy::new(|| Regex::new(r"([xmas])([><])(\d+):(\w+),").unwrap());
    pub fn new() -> Self {
        todo!()
    }
}

struct FlowKey(String);

enum Comparison {
    GreaterThan,
    LessThan,
}

enum Field {
    X,
    M,
    A,
    S,
}

fn main() {
    let input = String::from(
        r#"
px{a<2006:qkq,m>2090:A,rfg}
pv{a>1716:R,A}
lnx{m>1548:A,A}
rfg{s<537:gd,x>2440:R,A}
qs{s>3448:A,lnx}
qkq{x<1416:A,crn}
crn{x>2662:A,R}
in{s<1351:px,qqz}
qqz{s>2770:qs,m<1801:hdj,R}
gd{a>3333:R,R}
hdj{m>838:A,pv}

{x=787,m=2655,a=1222,s=2876}
{x=1679,m=44,a=2067,s=496}
{x=2036,m=264,a=79,s=2244}
{x=2461,m=1339,a=466,s=291}
{x=2127,m=1623,a=2188,s=1013}
    "#
        .trim(),
    );

    let (workflows, items) = input.split_once("\n\n").unwrap();
    let workflows: Vec<_> = workflows
        .lines()
        .map(str::trim)
        .map(|s| Workflow::MATCHER.captures(s).unwrap())
        .map(|c| c.extract().1)
        .map(|[key, flows]| {
            (
                key,
                Flow::MATCHER
                    .captures_iter(flows)
                    .map(|c| c.extract().1)
                    .map(|[field, comparison, number, next]| {
                        (field, comparison, number, next)
                    })
                    .collect::<Vec<_>>(),
            )
        })
        .collect();

    println!("{:?}", workflows);
}
