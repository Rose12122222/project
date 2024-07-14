const xValues = ["A", "B", "C", "D", "E"];
const yValues1 = [10, 15, 20];
const yValues2 = [15, 20, 25];
const yValues3 = [20, 25, 30];
const yValues4 = [25, 30, 35];
const barColors = ["red", "green", "blue"];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [
      {
        label: "Dataset 1",
        data: yValues1,
        backgroundColor: barColors[0]
      },
      {
        label: "Dataset 2",
        data: yValues2,
        backgroundColor: barColors[1]
      },
      {
        label: "Dataset 3",
        data: yValues3,
        backgroundColor: barColors[2]
      },
      {
        label: "Dataset 4",
        data: yValues4,
        backgroundColor: barColors[0] // Sử dụng màu của Dataset 1 để lặp lại
      }
    ]
  },
  options: {
    indexAxis: 'x',
    scales: {
      x: {
        stacked: true,
      },
      y: {
        min: 0,
        max: 40
      }
    }
  }
});