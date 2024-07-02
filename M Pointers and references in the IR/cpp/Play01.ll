; ModuleID = 'Play01.cpp'
source_filename = "Play01.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Inner = type { i32 }
%struct.A = type { %struct.Inner, [4 x i32] }

@__const._Z3foov.i = private unnamed_addr constant %struct.Inner { i32 199 }, align 4

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z3foov(%struct.A* noalias sret(%struct.A) align 4 %0) #0 {
  %2 = alloca %struct.Inner, align 4
  %3 = alloca %struct.A, align 4
  %4 = bitcast %struct.Inner* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 bitcast (%struct.Inner* @__const._Z3foov.i to i8*), i64 4, i1 false)
  %5 = bitcast %struct.A* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %5, i8 0, i64 20, i1 false)
  %6 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 0
  %7 = bitcast %struct.Inner* %6 to i8*
  %8 = bitcast %struct.Inner* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 4 %8, i64 4, i1 false)
  %9 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 1
  %10 = getelementptr inbounds [4 x i32], [4 x i32]* %9, i64 0, i64 0
  %11 = bitcast %struct.A* %3 to i8*
  %12 = bitcast %struct.A* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 4 %12, i64 20, i1 false)
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local noundef i32 @_Z3bar1Ai(%struct.A* noundef byval(%struct.A) align 8 %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4
  %4 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 1
  %5 = load i32, i32* %3, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 %6
  %8 = load i32, i32* %7, align 4
  ret i32 %8
}

; Function Attrs: mustprogress noinline norecurse nounwind uwtable
define dso_local noundef i32 @main() #3 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.A, align 8
  store i32 0, i32* %1, align 4
  call void @_Z3foov(%struct.A* sret(%struct.A) align 4 %2)
  %3 = call noundef i32 @_Z3bar1Ai(%struct.A* noundef byval(%struct.A) align 8 %2, i32 noundef 2)
  ret i32 %3
}

attributes #0 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress noinline norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
