//
//  ViewController.m
//  GitReference
//
//  Created by Jordan Nelson on 2/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"

static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+10);
    [self.view addSubview:scrollView];
    
    int topMargin = 20;
    CGFloat labelMaxWidth = self.view.frame.size.width;
    
    UILabel *gitReference = [[UILabel alloc]initWithFrame:CGRectMake(margin, topMargin, labelMaxWidth - 10, 20)];
    gitReference.textColor = [UIColor blueColor];
    gitReference.text = @"Git Reference";
    [scrollView addSubview:gitReference];
    
    
    int verticalSpace = 40;
    
    for (int i = 0; i < [self gitCommands].count; i++)
    {
        UILabel *referenceLabels = [[UILabel alloc]initWithFrame:CGRectMake(17, verticalSpace + 10, labelMaxWidth, 20)];
        referenceLabels.text = [self gitCommands][i][Command];
        [scrollView addSubview:referenceLabels];
        verticalSpace += 20;
        
        UILabel *gitCommandLabels = [[UILabel alloc]initWithFrame:CGRectMake(25, verticalSpace + 10, labelMaxWidth, 45)];
        gitCommandLabels.numberOfLines = 0;
        gitCommandLabels.text = [self gitCommands][i][Reference];
        [scrollView addSubview:gitCommandLabels];
        verticalSpace += 50;
    }
}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
