open Setup;
open BL;

describe("Example", ({test}) => {
  test("works", ({expect}) =>
    expect.string(Bl.example()).toMatchSnapshot()
  );
});
