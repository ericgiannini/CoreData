//
//  ChoreLogMO+CoreDataProperties.h
//  CoreData
//
//  Created by Eric Giannini on 12/3/15.
//  Copyright © 2015 Unicorn Mobile, LLC. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChoreLogMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChoreLogMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *finish_time;
@property (nullable, nonatomic, retain) ChoreMO *chore_done;
@property (nullable, nonatomic, retain) PersonMO *chore_person;

@end

NS_ASSUME_NONNULL_END
