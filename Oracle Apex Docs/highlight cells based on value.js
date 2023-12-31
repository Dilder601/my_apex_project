// function and global variable:

function highlight_ig_cells() {
    // for each cell in marked column
    $('.highlight td.JOB').each(function() {
        // get cell text
        cellData = $(this).text();
        // rules for coloring
        if (cellData == 'SALES')
            this.style.backgroundColor = '#40E0D0';
        else if (cellData == 'IT')
            this.style.backgroundColor = '#FF7F50';
        else if (cellData == 'PRESIDENT')
            this.style.backgroundColor = '#6495ED';
        else if (cellData == 'MANAGER')
            this.style.backgroundColor = '#40E0D0';
            else if (cellData == 'CLERK')
            this.style.backgroundColor = '#9FE2BF';
            else if (cellData == 'SALESMAN')
            this.style.backgroundColor = '#C0C0C0';
            else if (cellData == 'ANALYST')
            this.style.backgroundColor = '#008000';
    })
};

// Execute when Page Loads

highlight_ig_cells();

